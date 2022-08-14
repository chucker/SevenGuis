using System.Globalization;

namespace SevenGuis.Maui.Converters;

// TODO: port LambdaConverters to MAUI
public class FloatToStringConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is float f)
            return f.ToString();

        return null;
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is string s && float.TryParse(s, out var f))
            return f;

        return null;
    }
}
