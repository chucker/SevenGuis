using CommunityToolkit.Mvvm.ComponentModel;

namespace SevenGuis.Maui.Pages;

public partial class TemperatureViewModel : ObservableObject
{
    [ObservableProperty]
    [NotifyPropertyChangedFor(nameof(Fahrenheit))]
    private float _Celsius;

    public float Fahrenheit
    {
        get => (Celsius * 9 / 5) + 32;
        set => Celsius = (value - 32) * 5 / 9;
    }
}
