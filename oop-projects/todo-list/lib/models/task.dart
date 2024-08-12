// task.dart
/*
+--------------------+
|        Task        |
+--------------------+
| - desc: String     |
| - status: Status   |
+--------------------+
| + setDesc()        |    
| + getDesc()        |    
| + setStatus()      |      
| + getStatus()      |      
| + getStatus()      |      
| + isComplete()     |       
+--------------------+
*/


class Task {}



enum TaskStatus {
  started,
  archived,
  scheduled,
  completed,
  inProgress,
}