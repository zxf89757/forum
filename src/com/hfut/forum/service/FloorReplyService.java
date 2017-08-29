package com.hfut.forum.service;

import java.util.List;

import com.hfut.forum.dao.FloorReplyDao;
import com.hfut.forum.domain.FloorReply;

public class FloorReplyService {
	private FloorReplyDao floorReplyDao;
	public void setFloorReplyDao(FloorReplyDao floorReplyDao) {
		this.floorReplyDao = floorReplyDao;
	}
	public void save(FloorReply floorReply) {
		floorReplyDao.save(floorReply);
	}
	public List<FloorReply> findByPageRid(Integer rid, int begin) {
		int limit=5;
		return floorReplyDao.findByPageRid(rid,begin,limit);
	}
}
