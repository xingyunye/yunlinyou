package repository

import (
	"github.com/RaymondCode/simple-demo/global"
	"github.com/RaymondCode/simple-demo/model"
	"gorm.io/gorm"
)

type VideoRepository struct{}

// QueryByIds 根据id列表查询video集合，同时填充video的author
func (vr *VideoRepository) QueryByIds(ids []int64) ([]model.Video, error) {
	var videoList []model.Video
	if err := global.DB.Preload("Author").Find(&videoList, ids).Error; err != nil {
		return nil, err
	}
	return videoList, nil
}

// UpdateFavoriteCount 更新video的favorite_count
func (vr *VideoRepository) UpdateFavoriteCount(videoId int64, count int64) error {
	return global.DB.Model(&model.Video{}).Where("id = ?", videoId).Update("favorite_count", count).Error
}

func (vr *VideoRepository) QueryVideosSince(latestTimeStr string) ([]model.Video, error) {
	var videos []model.Video
	err := global.DB.Preload("Author").Where("create_time < ?", latestTimeStr).Limit(30).Order("create_time DESC").Find(&videos).Error
	if err != nil {
		return nil, err
	}
	return videos, nil
}

func (vr *VideoRepository) QueryAllVideos() ([]model.Video, error) {
	var videos []model.Video
	err := global.DB.Preload("Author").Limit(30).Order("create_time DESC").Find(&videos).Error
	if err != nil {
		return nil, err
	}
	return videos, nil
}

// QueryVideosByUserId 根据用户id查询此用户上传的video集合
func (vr *VideoRepository) QueryVideosByUserId(userId int64) ([]model.Video, error) {
	var videos []model.Video
	if err := global.DB.Where("user_id = ?", userId).Find(&videos).Error; err != nil {
		return nil, err
	}
	return videos, nil
}

// InsertVideo 存储上传的视频信息
func (vr *VideoRepository) InsertVideo(video model.Video) error {
	if err := global.DB.Create(&video).Error; err != nil {
		return err
	}
	return nil

}

// InCreCommentCount 增加评论数量
func (vr *VideoRepository) InCreCommentCount(videoId int64, count int) error {
	return global.DB.Model(&model.Video{}).Where("id = ?", videoId).Update("comment_count", gorm.Expr("comment_count + ?", count)).Error
}

// DeCreCommentCount 减少评论数量
func (vr *VideoRepository) DeCreCommentCount(videoId int64, count int) error {
	return global.DB.Model(&model.Video{}).Where("id = ?", videoId).Update("comment_count", gorm.Expr("comment_count - ?", count)).Error
}
