package com.zhang.javabean;
// Room class with needed variables and methods
public class Room {

	private int roomnum;
//	private String roomname;
	private String capacity;
	private String location;
	private String equipment; 
	
	public Room(){
		roomnum = 0;
//		roomname = "";
		capacity = "";
		location = "";
		equipment = "";
	}
	
	public Room(int roomnum, String capacity){
		this.roomnum= roomnum;
		this.capacity = capacity;		
	}
	
	public Room(int roomnum, String capacity,String location,String equipment){
		this.roomnum= roomnum;
		this.capacity = capacity;
		this.location = location;
		this.equipment = equipment;
	}
	
//	public String getRoomname() {
//		return roomname;
//	}
//
//	public void setRoomname(String roomname) {
//		this.roomname = roomname;
//	}

	public String changeCapacity(){
		return capacity;
		
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}

	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}


	public String getLocation() {
		return location;
	}

	public String getEquipment(){
		return equipment;
	}
}
