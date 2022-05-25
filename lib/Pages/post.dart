import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';


class postPage extends StatefulWidget {


  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          backgroundColor: Colors.purple[800],
          title: Text(("2022 ERASMUS"),style: TextStyle(color: Colors.white,),),
          actions :<Widget> [
            Padding(
              padding:EdgeInsets.only(right: 10),
            child:LikeButton(
              circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepPurpleAccent: Colors.grey,
                );
              },
              likeCount: 0,
              countBuilder:(int? count, bool isLiked, String text) {
                var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "0",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
            ),
    ),
          ],
        ),
        body: posticerigi());
  }

}

class posticerigi extends StatefulWidget {
  posticerigi({Key? key}) : super(key: key);

  @override
  State<posticerigi> createState() => _posticerigiState();
}

class _posticerigiState extends State<posticerigi> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child:SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width:screenSize.width ,
            height: screenSize.height *.825,

            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[



                ConstrainedBox(
                  constraints:new BoxConstraints(
                maxHeight: 450),

                    child: new Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    reverse:false,
                    child:Align(

                      alignment:Alignment.topLeft,
                      child:Padding(
                        padding: EdgeInsets.only(left: 5,top: 18),
                     child: new AutoSizeText ("1-Application Conditions:Important Note: Allocated to our University by the National Agency for the 2021-2022 Academic Year.All students to be selected as Candidate Grant since the amount of the grant is not yet determined.status will be.In the academic year (2021-2022) in which the student will participate in the Program, at least the second yearbe a student,The highest grade point averages of Associate / Undergraduate / Internship Mobility studentsless than 2.20 / 4.00; The students of Master's Doctorate/PhD/internship mobility at this level are the mostIt must be at least 2.50 / 4.00."
                          "1-Application Conditions:Important Note: Allocated to our University by the National Agency for the 2021-2022 Academic Year.All students to be selected as “Candidate Grant” since the amount of the grant is not yet determined.status will be.In the academic year (2021-2022) in which the student will participate in the Program, at least the second yearbe a student,The highest grade point averages of Associate / Undergraduate / Internship Mobility studentsless than 2.20 / 4.00; The students of Master's/Doctorate/PhD/internship mobility at this level are the mostIt must be at least 2.50 / 4.00.The students who apply, are prepared by Maltepe University School of Foreign Languages.must take the foreign language exam and get at least 50 points out of 100.YDS (valid for 3 years KPDS, ÜDS) or equivalent by ÖSYMStudents who have received 50 points or more from the exams are not obliged to take the exam. Thisthe document showing the exam results of the students, together with the other application documents.They are required to send an e-mail to the international office. For the equivalence table, see:https://www.osym.gov.tr/Eklenti/101,yabanci-dil-esdegerleri-250713pdf.pdf?0Candidates who apply at any of the education levels at Maltepe University(associate, bachelor's, master's and doctorate) enrolled in a higher education program,Must be a regular student. Full-time student, 30 per semesterECTS/ECTS credits are determined as a student with a course load. The only lesson left or thisStudents who will not be able to complete their credit load, even if they are successful, will not be able to complete their mobility.they will not benefit.Evaluation to be used in evaluating applications for the 2021-2022 Academic YearThe criteria and weighted scores are:Academic success level: 50%Language level: 50%Children of Martyrs and Veterans: +15 pointsStudents with disabilities (provided that the disability is documented): +10 pointsWithin the scope of the Social Services Law No. 2828, protection, care orFor students who have taken a housing decision: +10 pointsSubmitting an internship acceptance letter at the time of application: +10 pointsEarlier benefit (with or without grant): -10 points (out of a total of 100 points)(-0.4 according to the 4-point system) (A student who has achieved mobility has the sameIt is applied in case of re-applying within the stage. Before mobilityapplication of both education and internship mobility at the same timeIn the case of the secondIn the mobility type, “-20 points reduction is applied. Deductions student's totalpoints): -10 pointsParticipation in mobility in the country of citizenship: -10 pointsWithout giving notice of waiver within the specified time despite being selected for mobilitynot participating in the mobility (without passing the time granted by the higher education institution)If they give up, no point reduction is applied.): -10 pointsApplying for two types of mobility at the same time (student preferred mobilitytype is reduced): -10 pointsFor students selected for mobility: Mobility by higher education institutionFailure to attend meetings/trainings held onApplicable in case of re-applying to Erasmus): -5 pointsDeclaring that he will take the language exam and not taking it without an excuse (the student's re-entering Erasmusapplied if applied): -5 pointsStudents who come to our University with preparatory class and lateral transfer and who are in the adjustment phaseapplications will not be considered. Students who have done Erasmus Mobility in previous termsYou can also receive an Erasmus Learning Mobility grant again. In a previous academic yearA student who has benefited from a study or internship mobility has completed the mobility in total (previouslyprovided that the internship and education period does not exceed 12 months in total,can benefit.Students who will participate in the mobility within the scope of Erasmus Study and Internship MobilityThey must have completed their education and internship by September 30, 2022 at the latest.",
                      style:GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white70,)),
            ),
            ),

      ),
          ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,top:9,bottom: 9),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child:AutoSizeText('COMMENTS:',
                    style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                    maxLines: 2,),),


                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(

                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.5,
                    )
                  ),
                  child:ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                     ConstrainedBox(
                       constraints: new BoxConstraints(
                        maxHeight: 70),

                        child: Padding(
                          padding: EdgeInsets.only(left: 10,top: 18),
                          child: AutoSizeText('Bilgilendirme için teşekkürler.',
                            style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                            maxLines: 2,),

                        ),
                      ),
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                            maxHeight: 70),

                        child: Padding(
                          padding: EdgeInsets.only(left: 10,top: 18),
                          child: AutoSizeText('Ofis neredeydi, gelip yüzyüze konuşmak istiyordum da.',
                            style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                            maxLines: 2,),

                        ),
                      ),
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                            maxHeight: 70),

                        child: Padding(
                          padding: EdgeInsets.only(left: 10,top: 18),
                          child: AutoSizeText('İngilizce sınavından muaf olma durumu var mıdır?',
                            style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                            maxLines: 2,),

                        ),
                      ),
                      ConstrainedBox(
                        constraints: new BoxConstraints(
                            maxHeight: 70),

                        child: Padding(
                          padding: EdgeInsets.only(left: 10,top: 18),
                          child: AutoSizeText('Daha fazla bilgi için Erasmus kulübüyle iletişime geçebilirsiniz.',
                            style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                            maxLines: 2,),

                        ),
                      ),

                    ],
                  )

                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: TextField(
                      textAlignVertical:TextAlignVertical.top,
                      maxLines: null,
                      minLines: null,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,),

                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),

                        contentPadding: EdgeInsets.only(top:10,bottom: 100, left: 20,right: 80),
                        labelText: 'Comment:',
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.send,

                      color: Colors.purple[800],
                    ),

                    onPressed: (){

                    },
                  ),
                )


              ],
            ),
            ),


        ],
      ),
      ),

    );
  }
}
