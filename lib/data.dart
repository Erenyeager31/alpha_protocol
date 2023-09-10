// ignore_for_file: non_constant_identifier_names

class QuizData {
  final String link, answer;
  QuizData(this.link, this.answer);
}

List<QuizData> master_clue_1 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353101/alpha_protocol_story1/Master_Clue_3__Skip_2_Clues_Dark_Room_wvowpf.png","123456"),  //master_clue_1 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353106/alpha_protocol_story1/Master_Clue_3_Skip_one_clue_NSS_Room_paul_sir_axnvwf.png","654321"),  //master_clue_1 2
];

List<QuizData> master_clue_2 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353105/alpha_protocol_story1/Master_Clue_11_Skip_two_clues_SFITAA_room_y95ssd.png","123456"),  //master_clue_2 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353102/alpha_protocol_story1/Master_Clue_11_skip_one_clue__bike_parking_binary_code_nh99ct.png","654321"),  //master_clue_2 2
];

List<QuizData> quiz_data_1 = [
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353061/alpha_protocol_story1/Clue_1_Accountants_dept_numoon.png","D1S1Q1"),//clue 1
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353086/alpha_protocol_story1/Clue_2_Server_Room_ighjq9.png",'D1S1Q2'),//clue 2
  QuizData("", "D1S1Q3"), //clue 3
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353102/alpha_protocol_story1/Clue_4_Workshop_cderan.png",'D1S1Q4'),//clue 4
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353097/alpha_protocol_story1/Clue_5_Library_fwly4t.png",'D1S1Q5'), //clue 5
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353098/alpha_protocol_story1/Clue_6_Canteen_xgsbrb.png",'D1S1Q6'),//clue 6
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353107/alpha_protocol_story1/Clue_7_Student_Council_erujb3.png",'D1S1Q7'), //clue 7
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353106/alpha_protocol_story1/Clue_8_Biometrics_rbin9r.png",'D1S1Q8'), //clue 8
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353088/alpha_protocol_story1/Clue_9_Tejas_Room_nnujhg.png",'D1S1Q9'), //clue 9
  QuizData("https://res.cloudinary.com/dxo9b7e2h/image/upload/v1694353090/alpha_protocol_story1/Clue_10_Lost_and_found_fqxkut.png",'D1S1Q10'), //clue 10
];

List quizItems = [master_clue_1,master_clue_2,quiz_data_1];


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