package hotel.room.service;

import java.util.List;

import hotel.common.domain.Page;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;

public interface RoomService {
   //Room
   List<Room> getRooms(Page page);
   Room getRoom(int roomNum);
   boolean addRoom(Room room);
   boolean updateRoom(Room room);
   Room findRoom(String roomType);
   void updateRoomResStatus(Room room);
   
   //RoomType
   List<RoomType> getRoomTypes(Page page);   
   RoomType getRoomType(String roomType);
   boolean addRoomType(RoomType roomType);
   boolean updateRoomType(RoomType roomType);
   boolean delRoomType(String roomType);
   
   int getRoomsCnt(); //총 객실
   int getRoomTypesCnt();
}