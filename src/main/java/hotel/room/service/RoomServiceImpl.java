package hotel.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.domain.Page;
import hotel.room.dao.RoomDao;
import hotel.room.dao.RoomDaoImpl;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;

@Service
public class RoomServiceImpl implements RoomService{
   @Autowired private RoomDao roomDao;
   
   public RoomServiceImpl() {
      this.roomDao = new RoomDaoImpl();
   }
   
   @Override
   public List<Room> getRooms(Page page){
      return roomDao.getRooms(page);
   }
   
   @Override
   public List<RoomType> getRoomTypes(Page page){
      return roomDao.getRoomTypes(page);
   }
   
   @Override
   public Room getRoom(int roomNum) {
      return roomDao.getRoom(roomNum);
   }
   
   @Override
   public Room findRoom(String roomType) {
	   return roomDao.findRoom(roomType);
   }

   @Override
   public void updateRoomResStatus(Room room) {
	  roomDao.updateRoomResStatus(room);
   }
   
   @Override
   public RoomType getRoomType(String roomType) {
      return roomDao.getRoomType(roomType);
   }
   
   @Override
   public boolean addRoom(Room room) {
      return roomDao.addRoom(room)>0;
   }
   
   @Override
   public boolean addRoomType(RoomType roomType) {
      return roomDao.addRoomType(roomType)>0;
   }
   
   @Override
   public boolean updateRoom(Room room) {
      return roomDao.updateRoom(room)>0;
   }
   
   @Override
   public int getRoomsCnt() {
      return roomDao.getRoomsCnt();
   }
   
   @Override
   public int getRoomTypesCnt() {
      return roomDao.getRoomTypesCnt();
   }
   
   @Override
   public boolean updateRoomType(RoomType roomType) {
      return roomDao.updateRoomType(roomType)>0;
   }
   
   @Override
   public boolean delRoomType(String roomType) {
      return roomDao.delRoomType(roomType)>0;
   }

}