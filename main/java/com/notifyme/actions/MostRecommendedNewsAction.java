package com.notifyme.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.notifyme.model.NmeNotificationsMaster;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class MostRecommendedNewsAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	public List<NmeNotificationsMaster> getrecommendedNewsList() {
		return recommendedNewsList;
	}

	public void setrecommendedNewsList(List<NmeNotificationsMaster> recommendedNewsList) {
		this.recommendedNewsList = recommendedNewsList;
	}

	List<NmeNotificationsMaster> recommendedNewsList = new ArrayList<NmeNotificationsMaster>();

	public String execute() {

		recommendedNewsList = NotificationsDataPersistUtil.getDataFromDB();

		for (int i = 0; i < recommendedNewsList.size(); i++) {
			String pattern = "E, dd MMMM ''yy hh:mm a z";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(recommendedNewsList.get(i).getArticlePublishDate());
			recommendedNewsList.get(i).setDisplayDate(date);
		}

		ValueStack stack = ActionContext.getContext().getValueStack();
		Map<String, Object> context = new HashMap<String, Object>();
		context.put("recommendedNewsList", recommendedNewsList);
		stack.push(context);

		
		return "success";
	}

}
