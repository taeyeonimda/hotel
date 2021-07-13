package kimkwangsoo.hotel.room.dao.map;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.room.domain.Room;
import kimkwangsoo.hotel.room.domain.RoomType;

public interface RoomMap {
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