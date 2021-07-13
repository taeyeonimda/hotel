package hotel.room.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotel.common.domain.Page;
import hotel.room.dao.map.RoomMap;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;

@Repository
public class RoomDaoImpl implements RoomDao{
   @Autowired private RoomMap roomMap;
   
   @Override
   public List<Room> getRooms(Page page){
      return roomMap.getRooms(page);
   }
   
   @Override
   public List<RoomType> getRoomTypes(Page page){
      return roomMap.getRoomTypes(page);
   }
   
   @Override
   public Room getRoom(int roomNum) {
      return roomMap.getRoom(roomNum);
   }
   
   @Override
   public Room findRoom(String roomType) {
	   return roomMap.findRoom(roomType);
   }
   
   @Override
   public void updateRoomResStatus(Room room) {
	  roomMap.updateRoomResStatus(room);
   }
   
   @Override
   public RoomType getRoomType(String roomType) {
      return roomMap.getRoomType(roomType);
   }
   
   @Override
   public int addRoom(Room room) {
      return roomMap.addRoom(room); 
   }
   
   @Override
   public int addRoomType(RoomType roomType) {
      return roomMap.addRoomType(roomType);
   }
   
   @Override
   public int updateRoom(Room room) {
      return roomMap.updateRoom(room);
   }
   
   @Override
    public int getRoomsCnt(){
      return roomMap.getRoomsCnt();
   }
   
   @Override
   public int getRoomTypesCnt() {
	   return roomMap.getRoomTypesCnt();
   }
   
   @Override
   public int updateRoomType(RoomType roomType) {
      return roomMap.updateRoomType(roomType);
   }
   
   @Override
   public int delRoomType(String roomType) {
      return roomMap.delRoomType(roomType);
   }
}