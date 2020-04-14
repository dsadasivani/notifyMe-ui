package com.notifyme.actions;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.notifyme.model.NmeArticleDetail;
import com.notifyme.model.NmeNotificationsMaster;

public class DetailsPageAction {

	private String id;
	private String contentTitle;
	private String newsKey;
	private String sector;

	public List<NmeNotificationsMaster> relatedList;

	public List<NmeNotificationsMaster> related;
	
	public List<NmeNotificationsMaster> backTrackList;
	
	public HashMap<Timestamp, List<NmeNotificationsMaster>> backTrack=new HashMap<Timestamp, List<NmeNotificationsMaster>>();
	
	public String getNewsKey() {
		return newsKey;
	}

	public void setNewsKey(String newsKey) {
		this.newsKey = newsKey;
	}
	
	public HashMap<Timestamp, List<NmeNotificationsMaster>> getBackTrack() {
		return backTrack;
	}

	public void setBackTrack(HashMap<Timestamp, List<NmeNotificationsMaster>> backTrackNews) {
		this.backTrack = backTrackNews;
	}
	public List<NmeNotificationsMaster> getRelatedList() {
		return relatedList;
	}

	public void setRelatedList(List<NmeNotificationsMaster> relatedList) {
		this.relatedList = relatedList;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getContentTitle() {
		return contentTitle;
	}

	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}

	private String contentDetails;
	// public String content;
	public NmeArticleDetail detailsObj;

	public String getContentDetails() {
		return contentDetails;
	}

	public void setContentDetails(String contentDetails) {
		this.contentDetails = contentDetails;
	}

	public String getId() {
		return id;
	}

	public NmeArticleDetail getDetailsObj() {
		return detailsObj;
	}

	public void setDetailsObj(NmeArticleDetail detailsObj) {
		this.detailsObj = detailsObj;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String execute() {
		System.out.println("id" + id+"sector"+sector);
		String sectorIn=NotificationsDataPersistUtil.getSectorById(id);
		List<NmeArticleDetail> nm = NotificationsDataPersistUtil.getContentData(id);
		if (nm.size() > 0) {
			this.setDetailsObj(nm.get(0));
			System.out.println("detailspage"+nm.get(0));
		}

		related = NotificationsDataPersistUtil.getRelatedNewsList(sectorIn);		
		this.setRelatedList(related);
		newsKey = newsKey.replace("&amp;","&");
		backTrackList=NotificationsDataPersistUtil.getDataByKey(newsKey);
		
		
		//HashMap<Timestamp, List<NmeNotificationsMaster>> backTrackNews = new HashMap<Timestamp, List<NmeNotificationsMaster>>();
		if(backTrackList.size()>0) {
			Set dateSet=new HashSet();
			
			for(NmeNotificationsMaster n : backTrackList) {
				List<NmeNotificationsMaster> newsList=new ArrayList<NmeNotificationsMaster>();
					
				if(dateSet.add(n.getArticlePublishDate()))
				{
					newsList.add(n);
					backTrack.put(n.getArticlePublishDate(), newsList);
				}
				else
				{
					List<NmeNotificationsMaster> newList=new ArrayList<NmeNotificationsMaster>();
					newList=backTrack.get(n.getArticlePublishDate());
					newList.add(n);
					backTrack.put(n.getArticlePublishDate(), newList);
				}
			}
			
			
		}
		
		System.out.println("backtrack size"+backTrackList.size());
		this.setBackTrack(backTrack);
		
		return "success";

	}	

}