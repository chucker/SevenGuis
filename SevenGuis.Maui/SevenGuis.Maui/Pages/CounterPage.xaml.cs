namespace SevenGuis.Maui.Pages;

public partial class CounterPage : ContentPage
{
    public CounterPage()
    {
        InitializeComponent();

        BindingContext = new CounterPageViewModel();
    }
}
