package hotel.room.dao;

import java.util.List;

import hotel.common.domain.Page;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;

public interface RoomDao {
   //Room
      List<Room> getRooms(Page page);
      Room getRoom(int roomNum);
      int addRoom(Room room);
      int updateRoom(Room room);
      Room findRoom(String roomType);
      void updateRoomResStatus(Room room);
      
      //RoomType
      List<RoomType> getRoomTypes(Page page);   
      RoomType getRoomType(String roomType);
      int addRoomType(RoomType roomType);
      int updateRoomType(RoomType roomType);
      int delRoomType(String roomType);
      
      int getRoomsCnt(); //총 객실 
      int getRoomTypesCnt();
}
