using CommunityToolkit.Mvvm.ComponentModel;

using Microsoft.Maui.Controls;

using System;
using System.Windows.Input;

namespace SevenGuis.Maui.Pages
{
	public partial class CounterPageViewModel : ObservableObject
	{
        [ObservableProperty]
        private int _Count;

        private Command _IncrementCommand;
        public ICommand IncrementCommand => _IncrementCommand ??= new Command(() =>
        {
            Count++;
        });
    }
}
