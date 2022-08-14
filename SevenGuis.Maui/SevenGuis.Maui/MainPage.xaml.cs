using CommunityToolkit.Mvvm.Input;
using SevenGuis.Maui.Pages;

using System.Windows.Input;

namespace SevenGuis.Maui;

public partial class MainPage : ContentPage
{
    public MainPage()
    {
        InitializeComponent();

        BindingContext = this;
    }

    private IAsyncRelayCommand _Navigate;
    public IAsyncRelayCommand Navigate
        => _Navigate ??= new AsyncRelayCommand<string>(async destination =>
    {
        switch (destination)
        {
            case "Counter":
                await Navigation.PushAsync(new CounterPage());
                break;
            default:
                break;
        }
    });
}
