# widget_gallery

There is a simple Flutter widget gallery!

You can get this application with different widgets and customize them how do you want.
Currently, the gallery includes the following widgets: 
- BaseButton (More convenient than the standard ElevatedButton);
- BaseTextField (You can quickly and easily switch to password entry mode); 
- BigTextField (A text input field whose height can be adjusted); 
- ActionPanel (Includes ActionPanelListTile);
- ArcProgressBar (Progress bar in the form of an arc);
- ContainerWithButton (Simple bordered container with icon button);
- HotBottomSheet (A quick bottom sheet that gets a child of the Widget type).

You can see the examples below.

<img src="example.png" width="300" height="600">  <img src="example_2.png" width="300" height="200">

And also, there are some helper methods:
- RelativeRect getDropdownMenuPosition({required BuildContext context, required TapDownDetails details}) - for getting  "details" you gotta use the onTapDown in GestureDetector or InkWell;
- extension (String) capitalize() - for capitalizing the firts letter;
- extension (List) swap(int first, int second) - for replacing two elements in list.
