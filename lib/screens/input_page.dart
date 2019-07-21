import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/widgets/icon_content.dart';
import 'package:bmi/widgets/reusableCard.dart';
import 'package:bmi/constants.dart';
import 'results_page.dart';
import 'package:bmi/widgets/bottom_button.dart';
import 'package:bmi/widgets/round_iconButton.dart';
import 'package:bmi/logic/calculate.dart';
//TODO: no todo 



enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI App",style: kappBarStyle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Row(children: <Widget>[
              Expanded(
                child: new ReusableCard(
                onPress: (){
                  setState(() {
                   selectedGender = Gender.male; 
                  });
                },
                colour: selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                cardChild: new IconContent(icon: FontAwesomeIcons.mars, label: "MALE",),
                ),
              ),
              Expanded(
                child: new ReusableCard(
                onPress: (){
                  setState(() {
                   selectedGender = Gender.female; 
                  });
                },
                colour: selectedGender == Gender.female? kActiveCardColor : kInactiveCardColor,
                cardChild: new IconContent(icon: FontAwesomeIcons.venus,label: "FEMALE",),
                ),
              ),
            ],
            ),
          ),
          Expanded(
                child: new ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Height",style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),style: kNumberTextStyle,),
                          Text("cm",style: kLabelTextStyle,),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        ),
                        child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                           height = newValue.round(); 
                          });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Expanded(
            child: Row(
              children: <Widget>[
              Expanded(
                child: new ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Weight",style: kLabelTextStyle,),
                      Text(weight.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                             weight++; 
                            });
                          },
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                             weight--; 
                            });
                          },
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
              ),
              Expanded(
                child: new ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Age",style: kLabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                             age++; 
                            });
                          },
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                             age--; 
                            });
                          },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
            ),
          ),
          new ButtomButton(buttonTitle: "CALCULATE",
          onTap: (){

            CalculatorBMI calc = CalculatorBMI(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder:(context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          }
          ),
        ],
      ),
    );
  }
}



