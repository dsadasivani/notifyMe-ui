package com.notifyme.model;

public class NmeIndicators {
	
	private String lastPrice;
	private String percentchange;
	private String change;
	private String direction;
	private String indicatorName;
	
	public String getIndicatorName() {
		return indicatorName;
	}
	public void setIndicatorName(String indicatorName) {
		this.indicatorName = indicatorName;
	}
	public String getLastPrice() {
		return lastPrice;
	}
	public void setLastPrice(String lastPrice) {
		this.lastPrice = lastPrice;
	}
	public String getPercentchange() {
		return percentchange;
	}
	public void setPercentchange(String percentchange) {
		this.percentchange = percentchange;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	@Override
	public String toString() {
		return "NmeIndicators [lastPrice=" + lastPrice + ", percentchange=" + percentchange + ", change=" + change
				+ ", direction=" + direction + ", indicatorName=" + indicatorName + "]";
	}
	
	
	
}
