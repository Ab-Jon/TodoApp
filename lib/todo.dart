import 'package:flutter/material.dart';

class Todo extends StatefulWidget{
  const Todo({Key? key}): super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();

}

  class _TodoAppState extends State<Todo>{
  // todo list items
  final List _todoItems = [];

  // Controller to help us track changes in our text field.
  final textController = TextEditingController();

  // Function to add or delete items
  addTodo(String task){
    if(task.isNotEmpty){
      setState((){
        _todoItems.add(task);
      });
    }
  }
  deleteTodo(int index){
    setState((){
      _todoItems.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: <Widget>[
            Text(
          "Todo",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D47A1),
            ),
            ),
            Text(
              "App",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFEB3B),
              ),
            ),
          ],
        )
      ),

      // The FAB (Floating Action Button) is the button that enables todo items to be added or edited on the list.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      onChanged: (value){
                        print(value);
                        print(textController.text);
                      },
                      decoration: const InputDecoration(
                        label: Text("Enter your todo activity here"),
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          addTodo(textController.text);
                          textController.clear();
                          Navigator.pop(context);
                        },
                      child: Text("Add"),
                    )
                  ],
                ),
              )
          );
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              child: new Wrap(
                spacing: 50.0,
                runSpacing: 50.0,
                direction: Axis.horizontal,
                children: [
                  const FlutterLogo(size: 30),
                  Text(
                    "Your List",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: _todoItems.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: GestureDetector(
                              onTap: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context)=> Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Text(_todoItems[index]),
                                    ),
                                );
                              },
                              child: Text(_todoItems[index])),
                            trailing: IconButton(
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (context) => Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      color: Colors.white,
                                      height: 200,
                                      child: Column(
                                       // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Are you sure you want to delete?"),
                                          ElevatedButton(
                                              onPressed: (){
                                                deleteTodo(index);
                                                Navigator.pop(context);
                                              },
                                            child: const Text("Delete"),
                                              ),
                                        ],
                                      ),
                                    ),
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red,),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
