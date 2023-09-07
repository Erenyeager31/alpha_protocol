// ignore_for_file: non_constant_identifier_names

class QuizData {
  final String link, answer;
  QuizData(this.link, this.answer);
}

List<QuizData> demo = [
  QuizData("https://images.unsplash.com/photo-1621440318464-72633426377b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2067&q=80","demo1"),
  QuizData("https://images.unsplash.com/photo-1559757742-654d5da2eaab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",'demo2'),
  QuizData("https://images.unsplash.com/photo-1559757740-e85122cb7466?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bnVtYmVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",'demo3'),
  QuizData("https://images.unsplash.com/photo-1587642667788-5c994cf1efee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",'demo4'),
  QuizData("https://images.unsplash.com/photo-1484173936665-9ae90b911638?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG51bWJlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",'demo5'),
  QuizData("https://images.unsplash.com/photo-1484335629320-0e089b87a106?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2l4fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",'demo6'), 
  QuizData("https://plus.unsplash.com/premium_photo-1669349127571-ebf4a6cbdf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2V2ZW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",'demo7'),
  QuizData("https://media.istockphoto.com/id/1455364223/photo/blue-ice-font-number-8-eight-3d.webp?b=1&s=170667a&w=0&k=20&c=ZHNUHqGWjz7cVAp9xCMjorgMr14x_PsHRE_1gOTD0uI=",'demo8'),
  QuizData("https://images.unsplash.com/photo-1524254725712-0d14ba4bbc17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG5pbmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",'demo9'),
  QuizData("https://media.istockphoto.com/id/1324985401/photo/portrait-of-handsome-mature-man-isolated-over-yellow-background-stock-photo.webp?b=1&s=170667a&w=0&k=20&c=HDgsUALK3WSx1JSsNOxkzuQo_6k5OL7MNXuQ1vxNLOU=",'demo10'),
  QuizData("https://images.unsplash.com/photo-1549313861-33587f3d2956?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2VpcmR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",'demo11'),
];

List<QuizData> q_data1 = [
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level1.jpg",'APGSL1'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level2.jpg",'VD1L2'),

  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level3.jpg",'AK1L3'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level4.jpg",'RT1L4'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level5.jpg",'AC1L5'), 
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level6.jpg",'APGGMRL6'),

  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_1/Level7.jpg",'LF1L7'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),

  
];

List<QuizData> q_data2 = [
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level1.jpg",'APGSL1'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level2.jpg",'VD2L2'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level3.jpg",'AK2L3'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level4.jpg",'RT2L4'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level5.jpg",'AC2L5'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level6.jpg",'AP2L6'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_2/Level7.jpg",'LF2L7'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),

];

List<QuizData> q_data3 = [
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","null"),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level1.jpg",'APGSL1'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level2.jpg",'VD3L2'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level3.jpg",'AK3L3'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level4.jpg",'RT3L4'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level5.jpg",'AC3L5'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level6.jpg",'APGGMRL6'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/StoryLine_3/Level7.jpg",'LF3L7'),
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Exit/Exit.jpg",'APGEL8'),
  
];

List<QuizData> master_clue = [
  QuizData("https://res.cloudinary.com/docvlyucw/image/upload/v1662390258/Alpha%20Protocol/Intro/Intro.jpg","123456"),  
];

List quizItems = [demo,q_data1,q_data2,q_data3,master_clue];