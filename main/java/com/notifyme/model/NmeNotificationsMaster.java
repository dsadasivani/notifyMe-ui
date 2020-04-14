package com.notifyme.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "NME_NOTIFICATIONS_MASTER")
public class NmeNotificationsMaster {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "news_generator")
	@SequenceGenerator(name="news_generator", sequenceName = "NOTIFICATIONS_SEQ")
	@Column(name = "id", updatable = false, nullable = false)
	private Long id;
	
	@Column(name = "preference")
	private String preference;
	
	@Column(name = "short_news")
	private String shortNews;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name = "detailed_news")
	//@Lob
	private String detailedNews;
	
	@Column(name = "news_link")
	private String newsLink;
	
	@Column(name = "created_date")
	private Timestamp createdDate;
	
	@Column(name = "article_publish_date")
	private Timestamp articlePublishDate;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "local_image_url")
	private String localImageUrl;

	
	@Column(name = "CONTENT_EXTRACTION_FLAG")
	private String contentExtractionFlag;
	
	@Transient
	private String displayDate;
	
	@Column(name = "sector")
	private String sector;
	
	@Column(name = "newsKey")
	private String newsKey;


	
	public String getNewsKey() {
		return newsKey;
	}
	public void setNewsKey(String newsKey) {
		this.newsKey = newsKey;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getDisplayDate() {
		return displayDate;
	}
	public void setDisplayDate(String displayDate) {
		this.displayDate = displayDate;
	}
	public String getContentExtractionFlag() {
		return contentExtractionFlag;
	}
	public void setContentExtractionFlag(String contentExtractionFlag) {
		this.contentExtractionFlag = contentExtractionFlag;
	}
	
	public String getLocalImageUrl() {
		return localImageUrl;
	}
	public void setLocalImageUrl(String localImageUrl) {
		this.localImageUrl = localImageUrl;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public String getShortNews() {
		return shortNews;
	}
	public void setShortNews(String shortNews) {
		this.shortNews = shortNews;
	}
	public String getDetailedNews() {
		return detailedNews;
	}
	public void setDetailedNews(String detailedNews) {
		this.detailedNews = detailedNews;
	}
	public String getNewsLink() {
		return newsLink;
	}
	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Timestamp getArticlePublishDate() {
		return articlePublishDate;
	}
	public void setArticlePublishDate(Timestamp articlePublishDate) {
		this.articlePublishDate = articlePublishDate;
	}
/*	@Override
	public String toString() {
		return "NotificationsMaster [preference=" + preference + ", shortNews=" + shortNews
				+ ", detailedNews=" + detailedNews + ", newsLink=" + newsLink
				+ ", createdDate=" + createdDate + ", articlePublishDate="
				+ articlePublishDate + "]";
	}
*/
	}