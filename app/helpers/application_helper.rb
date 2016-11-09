module ApplicationHelper
  def show_alert_messages
    render '/layouts/alerts'
  end

  def trasform_alert_key(k)
    return "danger" if k.to_s == "alert"
    return "success" if k.to_s == "notice"
    return k.to_s
  end

  def social_network_buttons_class(provider)
    return "btn btn-fb-login" if provider == :facebook
    return "btn btn-twitter" if provider == :twitter
    return "btn btn-linked_in" if provider == :linkedin
    return "btn btn-meetup" if provider == :meetup
    return "btn btn-google" if provider == :google_oauth2
  end

  def social_network_buttons_icons(provider)
    return "fa fa-facebook" if provider == :facebook
    return "fa fa-twitter" if provider == :twitter
    return "fa fa-linkedin" if provider == :linkedin
    return "fa fa-maxcdn" if provider == :meetup
    return "fa fa-google" if provider == :google_oauth2
  end

  def show_breadcrumbs
    render :partial => 'layouts/breadcrumb_nav'
  end

  def date_format d
    d.strftime("%F") if d
  end
  alias :df :date_format

  def date_format_at d
    d.strftime("%F at %H:%M") if d
  end
  alias :df_at :date_format_at

  def datetime_format d
    d.strftime("%F %H:%M") if d
  end
  alias :dtf :datetime_format

  def datetime_with_sec_format d
    d.strftime("%F %H:%M:%S") if d
  end

  def doc_date d
    d = d.to_date rescue nil
    d.strftime("%d %B %Y") if d
  end

  def short_data_format d
    d.strftime("%F") if d
  end
  alias :short_df :short_data_format

  def time_format d
    d.strftime("%H:%M") if d
  end
  alias :tf :time_format

  def truncate_info(info)
    return truncate(info.to_s, :length => 22, :omission => '....')
  end

  def yesno(value,yes_text="Yes", no_text="No", yes_label_class="label label-success", no_label_class="label label-warning" )
    if value
      html = raw("<span class='fa fa-check-square'></span> #{yes_text}")
      # content_tag(:span, fa_icon("check-square", text: yes_text), class: yes_label_class )
    else
      html = raw("<span class='fa fa-times'></span> #{no_text}")
      # content_tag(:span, fa_icon("times", text:no_text), class: no_label_class)
    end
  end

end
