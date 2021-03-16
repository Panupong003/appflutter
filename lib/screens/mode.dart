import 'package:apppro/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apppro/screens/home1.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  Widget sigOut() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Homee()));
      },
    );
  }

  List<String> stringransplant = [
    '      การปลูกทุเรียนสามารถทำได้ทั้งการขุดหลุมปลูก    ซึ่งเหมาะกับพื้นที่ที่ค่อนข้างแล้งและยังไม่มีการวางระบบน้ำไว้',
    '  ก่อนปลูก ซึ่งวิธีนี้ดินในหลุมจะช่วยเก็บความชื้นได้ดีขึ้น  แต่หากมีฝนตกชุก มีน้ำขังจะทำให้รากเน่าและต้นทุเรียนตายได้',
    ' ง่าย ส่วนการปลูกโดยไม่ต้องขุดหลุม (ปลูกแบบนั่งแท่นหรือยกโคก) เหมาะกับพื้นที่ฝนตกชุก วิธีนี้ทำให้มีการระบายน้ำดี',
    '   น้ำไม่ขังบริเวณโคนต้น แต่ต้องวางระบบน้ำให้ดีก่อนปลูก ซึ่งต้นทุเรียนจะเจริญเติบโตเร็วกว่าการขุดหลุม ทั้งนี้จุดเน้นที่',
    'สำคัญ คือ ควรใช้ต้นกล้าที่มีขนาดเล็ก  มีระบบรากดี ไม่ขดงอ แต่หากจะปลูกด้วยต้นกล้าขนาดใหญ่ควรตัดแต่งรากที่ขดงอ',
    '   ทั้งที่ก้นถุงและด้านข้าง รวมทั้งควรมีการพรางแสงให้กับต้นทุเรียนที่ปลูกใหม่ด้วยตาข่ายพรางแสงหรือ(ทาง) ใบมะพร้าว',
    'หรือปลูกไม้ที่ให้ร่มเงา เช่น กล้วย  เป็นต้น',
  ];
  List<String> stringMoisture = [
    'ทุเรียนชอบอากาศร้อนชื้น  อุณหภูมิที่เหมาะสมอยู่ในช่วงประมาณ 25 ถึง 30 องศาเซลเซียส',
    'มีความชื้นสัมพัทธ์ในอากาศประมาณ 75-85 เปอร์เซ็นต์ หากปลูกในพื้นที่ที่มีอากาศแห้งแล้ง',
    'พื้นที่ที่มีอากาศร้อนจัดเย็นจัด และมีลมแรง จะพบปัญหาใบไหม้หรือใบร่วง ทำให้ต้นทุเรียนไม่',
    'เจริญเติบโตหรือเติบโตช้า ให้ผลผลิตช้าและน้อยไม่คุ้มต่อการลงทุน (กรมวิชาการเกษตร)',
  ];
  List<String> stringFertilizer = [
    'ปุ๋ยคอก อัตราเป็นบุ้งกี๋ต่อต้นต่อปี เท่ากับ 2 เท่าของขนาดเส้นผ่าศูนย์กลางทรงพุ่ม(เมตร) แบ่งใส่ 2 ครั้งต่อปี',
    'ปุ๋ยเคมี สูตร 15-15-15 หรือ 16-16-16 อัตราเป็นกิโลกรัมต่อต้นต่อปี เท่ากับขนาดเส้นผ่าศูนย์กลางทรงพุ่ม',
    '(เมตร)แบ่งใส่ 2 ถึง 4 ครั้งต่อ',
  ];
  List<String> stringDisease = [
    '1).โรคจากเชื้อราไฟทอฟธอรา',
    ' 1.1 โรคเข้าทำลายใบ ให้พ่นสารเมตาแลกซิล หรืออีฟอไซท์อลูมินั่ม หรือกรดฟอสฟอรัส   ให้ทั่วทั้งภายในและนอกทรงพุ่ม',
    ' 1.2 โรคที่ระบบราก ใช้สารเมตาแลกซิลราดใต้ทรงพุ่มให้ทั่ว พร้อมกับกระตุ้นการเจริญของราก',
    '2).โรคใบติด พบอาการเล็กน้อยให้ตัดเผาทำลาย หากอาการรุนแรงให้พ่นด้วยสารคาร์เบนดาซิม',
    '3).เพลี้ยไก่แจ้   เมื่อพบยอดทุเรียนถูกทำลายมากกว่า 30 เปอร์เซ็นต์ของยอดหรือพบไข่บนยอดมากกว่า 20 เปอร์เซ็นต์',
    '   ให้พ่นด้วยสารแลมป์ดา ไซฮาโลทริน หรือคาร์บาริลหรือไซเปอร์เมทริน/โฟซาโลน ทุก 7 ถึง 10 วันจนใบแก่',
    '4).ไรแดง พ่นสาร โพรพาไกต์ สลับกับสารเอกซีไทอะซอกซ์',
    '5).หนอนเจาะผล พ่นด้วยสารสะเดา หรือสารแลมป์ดาไซฮาโลทริน หรือคาร์โบซัลแฟน หรือไซเพอร์เมทรินและโฟซาโลน',
    '   แต่ต้องหยุดใช้สารเคมีก่อนเก็บเกี่ยว 15 วัน',
    '6).หนอนเจาะเมล็ดทุเรียน พ่นด้วยสารไซเพอร์เมทริน/โฟซาโลน หรือสารไดอะซินอน แต่ต้องหยุดใช้สารเคมีก่อนเก็บเกี่ยว 15 วัน',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('                 My Manual'),
        actions: <Widget>[sigOut()],
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red[300]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/474x/88/47/88/884788088e90764a8c5aed3473e025fc.jpg'),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ADVICE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: Icon(Icons.construction),
              title: Text('Transplant', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(Icons.device_thermostat),
              title: Text('Moisture', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.eco_sharp),
              title: Text('Fertilizer', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('Disease', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
