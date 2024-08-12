/*
     +-------------------+
     |        Task       |
     +-------------------+
     | - desc: String    |
     | - status: Status  |
     +-------------------+
     | + setDesc()       |
     | + getDesc()       |
     | + setStatus()     |
     | + getStatus()     |
     | + getStatus()     |
     | + isComplete()    |
     +-------------------+

   +-----------------------+
   |      TaskManager      |
   +-----------------------+
   | - tasks: List<Task>   |
   +-----------------------+
   | + getTasks()          |
   | + addTask(Task)       |
   | + removeTask(i)       | 
   | + editTask(i, etc)    |
   | + markTask(i, Status) |   
   +-----------------------+

+-----------------------------+
|            App              |
+-----------------------------+
| - taskManager: TaskManager  |
+-----------------------------+
| + menu()                    |
| + start()                   |
| + close()                   |
| + viewTasks()               |
| + editTask(int)             |
| + addTask(String)           |
| + removeTask(int)           |
| + markTask(int, Status)     |
+-----------------------------+
*/
