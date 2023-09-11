// ignore_for_file: non_constant_identifier_names

class QuizData {
  final String link, answer;
  QuizData(this.link, this.answer);
}

List<QuizData> master_clue_1 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405477/alpha_protocol_story1/Master_Clue_1_Skip_2_Clues_Dark_Room_rv1lwz.png","D1S1M1_1"),  //master_clue_1 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405476/alpha_protocol_story1/Master_Clue_1__Skip_one_clue_NSS_Room_paul_sir_abzyrd.png","D1S1M1_2"),  //master_clue_1 2
];

List<QuizData> master_clue_2 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405439/alpha_protocol_story1/Master_Clue_2_Skip_two_clues_SFITAA_room_gfz8ik.png","D1S1M2_1"),  //master_clue_2 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405472/alpha_protocol_story1/Master_Clue_2__skip_one_clue__bike_parking_binary_code_kjqvwa.png","D1S1M2_2"),  //master_clue_2 2
];

List<QuizData> quiz_data_1 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405457/alpha_protocol_story1/Clue_1_Accountants_dept_lm1ycs.png","D1S1Q1"),//clue 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405480/alpha_protocol_story1/Clue_2_Server_Room_zabqnz.png",'D1S1Q2'),//clue 2
  //master clue 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405452/alpha_protocol_story1/Clue_3_Workshop_zpnf76.png",'D1S1Q3'),//clue 3
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405452/alpha_protocol_story1/Clue_4_Library_bqpw0p.png",'D1S1Q4'), //clue 4
  // if skip start here
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405469/alpha_protocol_story1/Clue_5_Canteen_ci9tt6.png",'D1S1Q5'),//clue 5
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405457/alpha_protocol_story1/Clue_6_Biometrics_fuvz0g.png",'D1S1Q6'), //clue 6
  //master clue 2
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405434/alpha_protocol_story1/Clue_7_Tejas_Room_knooct.png",'D1S1Q7'), //clue 7
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405462/alpha_protocol_story1/Clue_8_Lost_and_found_r2w2fy.png",'D1S1Q8'), //clue 8
  //come here after skip
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405477/alpha_protocol_story1/Clue_9_Room_No_412_pgdokm.png",'D1S1Q9'), //clue 9 index8
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694405431/alpha_protocol_story1/Clue_10_419_drenls.jpg",'D1S1Q10'), //clue 10 index9
  QuizData("When scanning D1S1Q111 user is directed to screen of final riddle with incremented index ", "D1S1Q11"), //index 10
  QuizData("Here when the user inputs answer it is checked here and if right then punch score", "123456") //index 11
];

List quizItems = [quiz_data_1,master_clue_1,master_clue_2];


// List<QuizData> q_data1 = [
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level1.jpg",'APGSL1'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level2.jpg",'VD1L2'),

//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level3.jpg",'AK1L3'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level4.jpg",'RT1L4'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level5.jpg",'AC1L5'), 
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level6.jpg",'APGGMRL6'),

//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level7.jpg",'LF1L7'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),

  
// ];

// List<QuizData> q_data2 = [
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level1.jpg",'APGSL1'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level2.jpg",'VD2L2'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level3.jpg",'AK2L3'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level4.jpg",'RT2L4'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level5.jpg",'AC2L5'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level6.jpg",'AP2L6'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level7.jpg",'LF2L7'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),

// ];

// List<QuizData> q_data3 = [
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level1.jpg",'APGSL1'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level2.jpg",'VD3L2'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level3.jpg",'AK3L3'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level4.jpg",'RT3L4'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level5.jpg",'AC3L5'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level6.jpg",'APGGMRL6'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level7.jpg",'LF3L7'),
//   QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),
  
// ];