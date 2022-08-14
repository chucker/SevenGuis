namespace SevenGuis.Maui.Pages;

public partial class TemperatureConverterPage : ContentPage
{
	public TemperatureConverterPage()
	{
		InitializeComponent();

		BindingContext = new TemperatureViewModel();
	}
}
