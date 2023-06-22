import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookinPage extends StatefulWidget {
  const BookinPage({super.key});

  @override
  State<BookinPage> createState() => _BookinPageState();
}

class _BookinPageState extends State<BookinPage> {
  Set<SeatNumber> selectedSeats = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amberAccent,
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text("Theatre Screen this side"),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  
             return  SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child:SeatLayoutWidget(
                onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                //  print("tapped $rowIndex $colIndex $updatedSeatState");
                if (updatedSeatState == SeatState.selected) {
                  selectedSeats.add(SeatNumber(rowIndex: rowIndex, colIndex: colIndex));
                }else{
                  selectedSeats.remove(SeatNumber(rowIndex: rowIndex, colIndex: colIndex));
                }
                },
                stateModel: SeatLayoutStateModel(
                  rows: 5,
                  cols: 5,
                  seatSvgSize: 30,
                  pathUnSelectedSeat: 'assets/bookmyseat/svg_unselected_bus_seat.svg',
                  pathSelectedSeat: 'assets/bookmyseat/svg_selected_bus_seat.svg',
                  pathSoldSeat: 'assets/bookmyseat/svg_sold_bus_seat.svg',
                  pathDisabledSeat: 'assets/bookmyseat/svg_disabled_bus_seat.svg',
                  currentSeatsState: [
                    [
                      SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      
                    ],
                        [
                      SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      
                    ],
                        [
                      SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      
                    ],
                        [
                      SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      
                    ],
                        [
                      SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      SeatState.unselected,
                       SeatState.unselected,
                      
                    ],
              
                    ],
                ),
              ));
                },
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg_disabled_bus_seat.svg',
                        width: 15,
                        height: 15,
                      ),
                      const Text('Disabled')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg_sold_bus_seat.svg',
                        width: 15,
                        height: 15,
                      ),
                      const Text('Sold')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets\bookmyseat/seat_unselected.svg',
                        width: 15,
                        height: 15,
                      ),
                      const Text('Available')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/bookmyseat/seat_selected.svg',
                        width: 15,
                        height: 15,
                      ),
                      const Text('Selected by you')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('Show my selected seat numbers'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFFfc4c4e)),
              ),
            ),
            const SizedBox(height: 12),
            Text(selectedSeats.join(" , "))
          ],
        ),
      );
    
  }
}

class SeatNumber {
  final int rowIndex;
  final int colIndex;

  const SeatNumber({required this.rowIndex, required this.colIndex});

  @override
  bool operator ==(Object other) {
    return rowIndex == (other as SeatNumber).rowIndex && colIndex == (other as SeatNumber).colIndex;
  }

  @override
  int get hashCode => rowIndex.hashCode;

  @override
  String toString() {
    return '[$rowIndex][$colIndex]';
  }
}
  
