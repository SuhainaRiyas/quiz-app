<?php 
include('config.php');

if(isset($_GET['quiz'])){
     if($_GET['quiz'] == 'topics'){
        $query = "select id,title from topics where status = '1'";
    
        $result = mysqli_query($connect,$query);
        $rows = mysqli_num_rows($result);

        if($rows>0){
            $data = array();
            while ($res = mysqli_fetch_assoc($result)) {
                $data[] = $res;
            }
            $response = array(
                'status' => 'success',
                'topics' => $data
            );
            echo json_encode($response);
        }else{
            $response = array(
                'status' => 'error',
                'message' => 'No quiz topics found'
            );
            echo json_encode($response);
        }  
        
     }

     if($_GET['quiz'] == 'questions'){
        $topicQuery = "select title from topics where id = '".$_POST['topic']."' AND status = '1' LIMIT 1";
        $qnQuery = "select `id`,question,option1,option2,option3,option4,correct_ans,level from questions where topic_id = '".$_POST['topic']."' AND status = '1'";
    
        $resultQn = mysqli_query($connect,$qnQuery);
        $rowsQn = mysqli_num_rows($resultQn);

        $resultTopic = mysqli_query($connect,$topicQuery);
        $rowsTopic = mysqli_fetch_assoc($resultTopic);
        if($rowsQn>0){
            $dataQn = $level = array();
            while ($res = mysqli_fetch_assoc($resultQn)) {
                $level[$res['level']][] = $res;
            }
            shuffle($level['beginner']);
            shuffle($level['intermediate']);
            shuffle($level['professional']);
            $begin = array_slice($level['beginner'],0,4);
            $inter = array_slice($level['intermediate'],0,3);
            $profess = array_slice($level['professional'],0,3);

            $finalQn  = array_merge($begin, $inter, $profess);

            foreach($finalQn as $finalval){
                $dataQn[] = ['qn_id'=>$finalval['id'],'qns'=>$finalval['question'],
                'options'=>[$finalval['option1'],$finalval['option2'],$finalval['option3'],$finalval['option4']],
                'correct_ans'=>$finalval['correct_ans'],'level' => $finalval['level']];
            }
            $response = array(
                'status' => 'success',
                'topic' => $rowsTopic['title'],
                'questions' => $dataQn
            );
            echo json_encode($response);
        }else{
            $response = array(
                'status' => 'error',
                'message' => 'No questions found for this topic'
            );
            echo json_encode($response);
        }  
        
     }

     if($_GET['quiz'] == 'getScore'){
        $scoreQuery = "select score from user_scores where topic_id = '".$_POST['topic']."'AND user_name = '".$_POST['name']."' order by id desc LIMIT 1";
    
        $result_score = mysqli_query($connect,$scoreQuery);
        $rows_score = mysqli_num_rows($result_score);

        if($rows_score>0){
            $res_score = mysqli_fetch_assoc($result_score);
            $response = array(
                'status' => 'success',
                'score' => $res_score['score'],
            );
            echo json_encode($response);
        }else{
            $response = array(
                'status' => 'error',
                'message' => 'No score found'
            );
            echo json_encode($response);
        }  
        
     }

     if($_GET['quiz'] == 'answers'){
        $data_ans = json_decode(file_get_contents('php://input'));
        $topic_id = $data_ans->ans->topics->topic_id;
        $name = $data_ans->ans->topics->user_name;
        $score = $data_ans->scoreData;
        $ques_ans = $data_ans->ans->qn_ans;
        

        foreach($ques_ans as $key=>$val){
           $user_ans = $val->user_answer;
           $correct_ans = $val->correct_ans;
           $insert_value = "INSERT INTO `user_answers` (`topic_id`, `user_name`, `qn_id`, `user_answer`, `correct_ans`) VALUES ('$topic_id','$name',$key,'$user_ans','$correct_ans')";
           $resultAns = mysqli_query($connect,$insert_value);
        }

        $scoreQry = "select score from user_scores where topic_id = '".$topic_id."'AND user_name = '".$name."' order by id desc LIMIT 1";
        $resScore = mysqli_query($connect,$scoreQry);
        $rowScore = mysqli_num_rows($resScore);
        if($rowScore>0){
            $userScore = mysqli_fetch_assoc($resScore);
            $update_score = "UPDATE `user_scores` SET `prev_score` = ".$userScore['score'].", `score`=".$score." WHERE topic_id = '".$topic_id."'AND user_name = '".$name."' ";
            $resultScore = mysqli_query($connect,$update_score);
            
        }else{
            $insert_score = "INSERT INTO `user_scores` (`topic_id`, `user_name`, `score`) VALUES ($topic_id,'$name',$score)";
            $resultScore = mysqli_query($connect,$insert_score);
        }

       

        if($resultAns && $resultScore){
            $response = array(
                'status' => 'success',
                'message' => 'Saved succesfully'
            );
            echo json_encode($response);
        }else{
            $response = array(
                'status' => 'error',
                'message' => 'Answers or score not saved in database'
            );
            echo json_encode($response);
        }  
     }

}else{
    $response = array(
        'status' => 'error',
        'message' => 'Invalid request'
    );
    echo json_encode($response);
}   

?>