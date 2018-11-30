package {
	import feathers.controls.Screen;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	public class StarlingRoot extends Screen
	{
		private var navigator:StackScreenNavigator;
		
		override protected function initialize():void
		{
			super.initialize();
			
			layout = new AnchorLayout();
			
			navigator = new StackScreenNavigator();
			navigator.layoutData = new AnchorLayoutData();
			(navigator.layoutData as AnchorLayoutData).top = 0;
			(navigator.layoutData as AnchorLayoutData).bottom = 0;
			var myAlbumItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(MainScreen);
			navigator.addScreen("mainScreen", myAlbumItem);
			navigator.rootScreenID = "mainScreen";
			addChild(navigator);
		}
	}
}
