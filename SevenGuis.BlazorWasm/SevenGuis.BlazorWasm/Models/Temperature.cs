public class Temperature
{
    private float _Celsius = 0;

    public float Celsius
    {
        get => _Celsius;
        set => _Celsius = value;
    }

    public float Fahrenheit
    {
        get => (_Celsius * 9 / 5) + 32;
        set
        {
            _Celsius = (value - 32) * 5 / 9;
        }
    }
}
