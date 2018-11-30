package {
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.utils.Align;
	
	public class MainScreen extends Screen
	{
		protected var headerLabel:Label;
		
		override protected function initialize():void
		{
			super.initialize();
			
			this.layout = new AnchorLayout();
			
//			var screenDiagonalInches:Number = Math.sqrt(
//					Math.pow(DeviceCapabilities.screenInchesX(Starling.current.nativeStage), 2) +
//					Math.pow(DeviceCapabilities.screenInchesY(Starling.current.nativeStage), 2));
//
//			if (screenDiagonalInches < 8)
//			{
//				scale = 1;//screenDiagonalInches / 10;
//			} else
//			{
//				scale = 1;
//			}
			
			addControls();
			layoutControls();
		}
		
		protected function addControls():void
		{
			headerLabel = new Label();
			headerLabel.touchable = false;
			headerLabel.textRendererFactory = textRendererFactory;
			var fontStyles:TextFormat = new TextFormat("Arial", 30, 0xFFFFFF, HorizontalAlign.LEFT, VerticalAlign.TOP);
			fontStyles.bold = true;
			headerLabel.fontStyles = fontStyles;
			headerLabel.fontStyles.horizontalAlign = Align.CENTER;
			headerLabel.fontStyles.verticalAlign = Align.CENTER;
			headerLabel.fontStyles.size = 20;
			headerLabel.paddingBottom = 2;
			headerLabel.text = "Title — Name";
			
			var bgSkin:Quad = new Quad(200, 80, 0x666666);
			
			headerLabel.backgroundSkin = bgSkin;
			addChild(headerLabel);

			
			
		}
		
		protected function textRendererFactory():ITextRenderer
		{
			var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
			textRenderer.useGutter = true;
			return textRenderer;
		}
		
		protected function layoutControls():void
		{
			var data:AnchorLayoutData = new AnchorLayoutData();
			data.left = 340;
			data.top = 24;
			data.right = 340;
			headerLabel.layoutData = data;
		}
	}
}
