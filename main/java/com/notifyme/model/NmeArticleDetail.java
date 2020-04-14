package com.notifyme.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="NME_ARTICLE_DETAIL")
public class NmeArticleDetail {

	@Id  @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="CONTENT_ID")
	private long contentId;
	
	@Column(name="ARTICLE_ID")
	private long articleId;
	
	@Lob
	@Column(name="ARTICLE_CONTENT")
	private String articleContent;
	
	@Temporal(value = TemporalType.DATE)
	@Column(name="EXTRACTION_DATE")
	private Date extractionDate;
	
	@Column(name="LEAD_IMAGE_URL")
	private String leadImageUrl;
	
	@Column(name="EXCERPT")
	private String excerpt;
	
	@Column(name="TITLE")
	private String title;

	public String getLeadImageUrl() {
		return leadImageUrl;
	}

	public void setLeadImageUrl(String leadImageUrl) {
		this.leadImageUrl = leadImageUrl;
	}

	public String getExcerpt() {
		return excerpt;
	}

	public void setExcerpt(String excerpt) {
		this.excerpt = excerpt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getContentId() {
		return contentId;
	}

	public void setContentId(long contentId) {
		this.contentId = contentId;
	}

	public long getArticleId() {
		return articleId;
	}

	public void setArticleId(long articleId) {
		this.articleId = articleId;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public Date getExtractionDate() {
		return extractionDate;
	}

	public void setExtractionDate(Date extractionDate) {
		this.extractionDate = extractionDate;
	}
}
