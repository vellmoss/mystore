class StaticPagesController < ApplicationController
#  attr_accessor :@arg1, :@arg2

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def graph
      @arg1 = 'Температура (°C)'
      @arg2 =  %w(Янв Фев Мар Апр Май Июн Июл Авг Сен Окт Ноя Дек)
      @serMos = [5.2, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
      @serNY  = [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
      @serIR  = [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
      @serKZ  = [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
  end

end
