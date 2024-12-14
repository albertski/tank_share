# frozen_string_literal: true

module ApplicationHelper
  def custom_button(text:, type: :link, form: nil, link: '#', bg_color: 'bg-purple-500', text_color: 'text-purple-500',
                    hover_bg_color: 'group-hover:bg-purple-600', hover_text_color: 'group-hover:text-white', icon: nil, custom_classes: '')
    if type == :link
      link_button(text: text, link: link, bg_color: bg_color, text_color: text_color, hover_bg_color: hover_bg_color,
                  hover_text_color: hover_text_color, icon: icon, custom_classes: custom_classes)
    elsif type == :submit && form
      submit_button(form, text: text, bg_color: bg_color, text_color: text_color, hover_bg_color: hover_bg_color,
                          hover_text_color: hover_text_color, icon: icon, custom_classes: custom_classes)
    else
      raise ArgumentError, 'Invalid type or missing form'
    end
  end

  private

  def link_button(text:, link:, bg_color:, text_color:, hover_bg_color:, hover_text_color:, icon:, custom_classes:)
    content_tag :a, href: link,
                    class: "relative inline-flex items-center justify-center p-4 px-6 py-3 overflow-hidden font-medium #{text_color} transition duration-300 ease-out border-2 #{bg_color} rounded-full shadow-md group #{custom_classes}" do
      content_tag(:span,
                  class: "absolute inset-0 flex items-center justify-center w-full h-full text-white duration-300 -translate-x-full #{hover_bg_color} group-hover:translate-x-0 ease") do
        icon_tag(icon)
      end +
        content_tag(:span, text,
                    class: "absolute flex items-center justify-center w-full h-full #{text_color} transition-all duration-300 transform group-hover:translate-x-full ease") +
        content_tag(:span, text, class: 'relative invisible')
    end
  end

  def submit_button(form, text:, bg_color:, text_color:, hover_bg_color:, hover_text_color:, icon:, custom_classes:)
    form.submit(text,
                class: "relative inline-flex items-center justify-center p-4 px-6 py-3 overflow-hidden font-medium #{text_color} transition duration-300 ease-out border-2 #{bg_color} rounded-full shadow-md group #{custom_classes}") do
      content_tag(:span,
                  class: "absolute inset-0 flex items-center justify-center w-full h-full text-white duration-300 -translate-x-full #{hover_bg_color} group-hover:translate-x-0 ease") do
        icon_tag(icon)
      end +
        content_tag(:span, text,
                    class: "absolute flex items-center justify-center w-full h-full #{text_color} transition-all duration-300 transform group-hover:translate-x-full ease") +
        content_tag(:span, text, class: 'relative invisible')
    end
  end

  def icon_tag(icon)
    return ''.html_safe unless icon

    content_tag(:svg, class: 'w-6 h-6', fill: 'none', stroke: 'currentColor', viewBox: '0 0 24 24',
                      xmlns: 'http://www.w3.org/2000/svg') do
      content_tag(:path, nil, stroke: 'currentColor', strokeLinecap: 'round', strokeLinejoin: 'round', strokeWidth: 2,
                              d: icon)
    end
  end
end
