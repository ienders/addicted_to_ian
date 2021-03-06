module BlogHelper

  def render_calendar(year, month, pre, nex, selected_days)
    previous_month = link_to("<<", params.merge({:mo => pre[:month], :yr => pre[:year] }))
    next_month     = link_to(">>", params.merge({:mo => nex[:month], :yr => nex[:year] }))
    calendar(
        :year                => year,
        :month               => month,
        :abbrev              => (0..0),
        :previous_month_text => previous_month,
        :next_month_text     => next_month,
        :month_name_class    => 'month_name',
        :month_nav_class     => 'month_nav') do |d|
      if selected_days.include?(d.mday)
        day_display = link_to(d.mday.to_s, blog_calendar_day_path(:by => 'date', :year => year, :month => month, :day => d.mday))
      else
        day_display = d.mday.to_s
      end
      [ day_display, { :class => selected_days.include?(d.mday) ? 'specialDay' : 'day' } ]
    end
  end
end