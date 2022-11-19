
import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    home: tic_tak(),
  ));

}
class tic_tak extends StatefulWidget {
  const tic_tak({Key? key}) : super(key: key);

  @override
  State<tic_tak> createState() => _tic_takState();
}

class _tic_takState extends State<tic_tak> {
  String p1 = "X";
  String p2 = "O";

  List<String> vallist=[];
  List<int> poslist =[];

  List<String> r_vallist=[];
  List<int> r_poslist =[];

  int i = 0, cnt = 0;
  List<String> l = List.filled(9, "");
  String msg = "Game is Running";
  bool winner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tic tak tok", style: TextStyle(color: Color(0xFF000000)),),
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 70,
              width: 250,
            margin: const EdgeInsets.all(10),
              color:Colors.teal,
              child: 
                Text(msg,style: const TextStyle(fontSize: 25),
              ),
          ),

          Expanded(child: Row(
            children: [
              abc(0,Colors.teal),
              abc(1,Colors.green),
              abc(2,Colors.teal),
            ],
          )),
          Expanded(child: Row(
            children: [
              abc(3,Colors.green),
              abc(4,Colors.teal),
              abc(5,Colors.green),
            ],
          )),
          Expanded(child: Row(
            children: [
              abc(6,Colors.teal),
              abc(7,Colors.green),
              abc(8,Colors.teal),
            ],
          )),

          Row(
            children: [
              Expanded(
                  child: 
                  ElevatedButton(onPressed: (){
                    if(poslist.length>0) {
                      win();
                      int lastpos = poslist.last;
                      String lastval = vallist.last;
                      
                      l[lastpos] ="";
                      cnt--;
                      
                      poslist.removeLast();
                      vallist.removeLast();

                      r_poslist.add(lastpos);
                      r_vallist.add(lastval);

                      print("${poslist}  ${vallist}");

                    setState((){

                    });
                      }
                    else
                      {
                        print("Inavlid");
                      }
                  }, child:  Text("Undu"),
                  ),
              ),
              Expanded(
                child: ElevatedButton(onPressed: ()
                {
                  l=List.filled(9, "");
                  cnt=0;
                  winner=false;
                  msg ="game is Runnung";
                  poslist.clear();
                  vallist.clear();
                  r_poslist.clear();
                  r_vallist.clear();
                  setState((){

                  });
                }, child: Text("Reset")),
              ),
              Expanded(
                  child: ElevatedButton(onPressed: ()
                      {
                        if(r_vallist.length>0)
                        {    win();
                            int lastpos =r_poslist.last;
                            String lasval=r_vallist.last;

                            l[lastpos]=lasval;
                            cnt++;

                            r_vallist.removeLast();
                            r_poslist.removeLast();

                            poslist.add(lastpos);
                            vallist.add(lasval);

                            print("${poslist}    ${vallist}");

                            setState((){

                            });
                        }
                      },child: Text("Redu")),
              ),
            ],
          )
        ],
      ),
    );
  }
    abc(int i,Color c)
    {
      return Expanded
          (child: InkWell(
               onTap: (l[i]=="" && winner==false)?() {
                 if(cnt%2==0)
                   {
                     l[i]=p1;
                     vallist.add(p1);
                   }
                 else
                   {
                     l[i]=p2;
                     vallist.add(p2);
                   }

                 poslist.add(i);
                 print("${poslist}  ${vallist}");
                 cnt++;
                 win();
                 setState((){});
               }:null,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,

            color: l[i]==""? c: (l[i]==p1? const Color(0xFF142130):const Color(0xFFF19805)),
            margin: const EdgeInsets.all(10),
            child: Text(l[i],textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color:(l[i]==p1? const Color(0xFFF19805): const Color(0xFF142130))),),
          ),
        )
      );
    }

    win()
    {
        if((l[0]== p1 && l[1]== p1 && l[2]== p1) ||
            (l[3]== p1 && l[4]== p1 && l[5]== p1) ||
            (l[6]== p1 && l[7]== p1 && l[8]== p1) ||
            (l[0]== p1 && l[3]== p1 && l[6]== p1) ||
            (l[1]== p1 && l[4]== p1 && l[7]== p1) ||
            (l[2]== p1 && l[5]== p1 && l[8]== p1) ||
            (l[0]== p1 && l[4]== p1 && l[8]== p1) ||
            (l[2]== p1 && l[4]== p1 && l[6]== p1))
          {
            msg="$p1 is winner";
            winner=true;
          }
        else if((l[0]== p2 && l[1]== p2 && l[2]== p2) ||
            (l[3]== p2 && l[4]== p2 && l[5]== p2) ||
            (l[6]== p2 && l[7]== p2 && l[8]== p2) ||
            (l[0]== p2 && l[3]== p2 && l[6]== p2) ||
            (l[1]== p2 && l[4]== p2 && l[7]== p2) ||
            (l[2]== p2 && l[5]== p2 && l[8]== p2) ||
            (l[0]== p2 && l[4]== p2 && l[8]== p2) ||
            (l[2]== p2 && l[4]== p2 && l[6]== p2))
        {
          msg="$p2 is winner";
          winner=false;
        }
        else if(cnt>8)
          {
            msg="Game Draw";
          }      
    }
}