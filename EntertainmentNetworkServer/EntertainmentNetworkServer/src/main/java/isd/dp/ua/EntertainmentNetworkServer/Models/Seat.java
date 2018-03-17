/* 
* This module is part of the Entertainment Network system 
* Copyright (c) SCC Soft Computer, Inc. 2018 
* All Rights Reserved 
* 
* This document contains unpublished, confidential and proprietary 
* information of SCC Soft Computer, Inc. No disclosure or use of 
* any portion of the contents of these materials may be made without the 
* express written consent of Soft Computer Consultants, Inc. 
* 
*/ 

package isd.dp.ua.EntertainmentNetworkServer.Models;
// Generated Feb 9, 2018 5:32:55 PM by Hibernate Tools 3.5.0.Final

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

import isd.dp.ua.EntertainmentNetworkServer.Common.BaseModel;

/**
 * Seat generated by hbm2java
 */
@SuppressWarnings("serial")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType
@Entity
@Table(name = "SEAT", schema = "PBAB")
public class Seat extends BaseModel implements java.io.Serializable
{	
	public Seat() {
	}

	public Seat(BigDecimal seatId, Floor floor, int seatNum, int seatRow, int seatType) {
		this.seatId = seatId;
		this.floor = floor;
		this.seatNum = seatNum;
		this.seatRow = seatRow;
		this.seatType = seatType;
	}

	public Seat(BigDecimal seatId, Floor floor, int seatNum, int seatRow, int seatType,
			Set<Tickets> ticketses) {
		this.seatId = seatId;
		this.floor = floor;
		this.seatNum = seatNum;
		this.seatRow = seatRow;
		this.seatType = seatType;
		this.ticketses = ticketses;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEAT_SEQ")
    @SequenceGenerator(name = "SEAT_SEQ", sequenceName = "SEAT_SEQ")
	@Column(name = "SEAT_ID", unique = true, nullable = false, precision = 22, scale = 0)
	public BigDecimal getSeatId()
	{
		return this.seatId;
	}

	public void setSeatId(BigDecimal seatId)
	{
		this.seatId = seatId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SEAT_FLR_ID", nullable = false)
	public Floor getFloor() 
	{
		return this.floor;
	}

	public void setFloor(Floor floor) 
	{
		this.floor = floor;
	}

	@Transient
	@XmlElement
	public BigDecimal getFloorId()
	{
		return this.getFloor() == null ? new BigDecimal("-1") : this.getFloor().getFlrId();
	}

	@Column(name = "SEAT_COLUMN", nullable = false, precision = 22, scale = 0)
	public int getSeatColumn()
	{
		return this.seatColumn;
	}

	public void setSeatColumn(int seatColumn)
	{
		this.seatColumn = seatColumn;
	}
	
	@Column(name = "SEAT_NUM", nullable = false, precision = 22, scale = 0)
	public int getSeatNum()
	{
		return this.seatNum;
	}

	public void setSeatNum(int seatNum)
	{
		this.seatNum = seatNum;
	}

	@Column(name = "SEAT_ROW", nullable = false, precision = 22, scale = 0)
	public int getSeatRow()
	{
		return this.seatRow;
	}

	public void setSeatRow(int seatRow)
	{
		this.seatRow = seatRow;
	}

	@Column(name = "SEAT_TYPE", nullable = false, precision = 22, scale = 0)
	public int getSeatType() 
	{
		return this.seatType;
	}

	public void setSeatType(int seatType) 
	{
		this.seatType = seatType;
	}
	
	@Column(name = "SEAT_ISACTIVE", nullable = false, precision = 1, scale = 0)
	public boolean getSeatIsactive() 
	{
		return this.seatIsactive;
	}

	public void setSeatIsactive(boolean seatIsactive)
	{
		this.seatIsactive = seatIsactive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "seat")
	public Set<Tickets> getTicketses() 
	{
		return this.ticketses;
	}

	public void setTicketses(Set<Tickets> ticketses) 
	{
		this.ticketses = ticketses;
	}

	@Override
	public String toString()
	{
		return "Seat [SeatId=" + this.getSeatId() + "]";
	}
	
	private BigDecimal seatId;
	@XmlTransient
	private Floor floor;
	private boolean seatIsactive;
	private int seatColumn;
	private int seatNum;
	private int seatRow;
	private int seatType;
	@XmlTransient
	private Set<Tickets> ticketses = new HashSet<Tickets>(0);
}