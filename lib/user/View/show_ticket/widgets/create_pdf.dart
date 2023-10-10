
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


createPdf( image,String movieName,String bookingId)=>pw.Padding(
  padding:const pw.EdgeInsets.all(10),
  child: pw.Center(child: 
  pw.Container(
  height: 500,
  width: 500,
 // color: PdfColor(0, 10, 10),
  child: pw.Column(children: [
    pw.SizedBox(height:10),
  pw.Image(image,
  height: 150,
  width: 150
  ),
      pw.SizedBox(height: 10),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('MovieName:',style: pw.TextStyle(color:const PdfColor(0,0,0 ),fontSize: 15,fontBold: pw.Font.courierBold() )),
      pw.Text(movieName,style:const pw.TextStyle(color:PdfColor(0,0,0 ),fontSize: 15)),

        ]
      ),
 pw.SizedBox(height: 10),
        pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('BookingId:',style: pw.TextStyle(color:const PdfColor(0,0,0 ),fontSize: 15,fontBold: pw.Font.courierBold() )),
                pw.Text(bookingId,style:const pw.TextStyle(color:PdfColor(0, 0, 0),fontSize: 15)),
        ]
      ),

         


   


   

  ])
  
  ))
   );