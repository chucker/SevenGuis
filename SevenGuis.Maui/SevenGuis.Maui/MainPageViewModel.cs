using CommunityToolkit.Mvvm.ComponentModel;

using Microsoft.Maui.Controls;

using System;
using System.Windows.Input;

namespace SevenGuis.Maui
{
	public partial class MainPageViewModel : ObservableObject
	{
        [ObservableProperty]
        private int _Count;

        //private int _Count;
        //public int Count
        //{
        //    get => _Count;
        //    set => SetProperty(ref _Count, value);
        //}

        private Command _IncrementCommand;
        public ICommand IncrementCommand => _IncrementCommand ??= new Command(() =>
        {
            Count++;
        });
    }
}
