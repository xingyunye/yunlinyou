package controller

import (
	"github.com/RaymondCode/simple-demo/model/response"
	"github.com/RaymondCode/simple-demo/service"
	"github.com/RaymondCode/simple-demo/utils"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

//CommentAction 评论操作
func CommentAction(c *gin.Context) {
	userId := utils.GetUserId(c)
	videoId, err := strconv.ParseInt(c.Query("video_id"), 10, 64)
	if err != nil {
		response.FailWithMessage("video_id参数无效", c)
		return
	}
	actionType := c.Query("action_type")
	if actionType == "1" {
		text := c.Query("comment_text")
		if text == "" {
			c.JSON(http.StatusPreconditionFailed, response.Response{StatusCode: 1, StatusMsg: "参数为空"})
			return
		}
		comment, err := service.GroupApp.CommentService.InsertComment(videoId, userId, text)
		if err != nil {
			response.FailWithMessage("获取user过程发生错误", c)
			return
		}
		response.OkWithCommentInfo(*comment, "success", c)
		return
	} else if actionType == "2" {
		commentId, err := strconv.ParseInt(c.Query("comment_id"), 10, 64)
		if err != nil {
			response.FailWithMessage("comment_id参数无效", c)
			return
		}
		if err := service.GroupApp.CommentService.Delete(commentId, videoId); err != nil {
			response.FailWithMessage("删除失败", c)
			return
		}
	}
	response.Ok(c)

}

// CommentList 评论列表
func CommentList(c *gin.Context) {
	video_id, err := strconv.ParseInt(c.Query("video_id"), 10, 64)
	if err != nil {
		response.FailWithMessage("video_id参数无效", c)
		return
	}
	token := c.Query("token")
	comments, err := service.GroupApp.CommentService.QueryComment(video_id, token)
	response.OkWithCommentListInfo(comments, "success", c)
}
