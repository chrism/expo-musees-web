initial_linebreak_transformer = lambda {|options|
  node = options[:node]
  if node.present? && node.element? && node.name.downcase == 'p'
    first_child = node.children.first
    if first_child.name.downcase == 'br'
      first_child.unlink
      initial_linebreak_transformer.call options
    end
  end
}

empty_paragraph_transformer = lambda {|options|
  node = options[:node]
  if node.present? && node.element? && node.name.downcase == 'p'

    if node.children.length == 1
      child = node.children.first.name.downcase
      if child == 'br'
        node.unlink
      elsif child == 'strong'
        if node.children.first.children.length == 1 && node.children.first.children.first.name.downcase == 'br'
          node.unlink
        end
      end
    end

    if node.text == Nokogiri::HTML("&nbsp;").text
      node.unlink
    end
  end
}

Sanitize::Rails.configure(
  :elements => [ 'p', 'br', 'a', 'strong' ],

  :attributes => {
    'a'   => ['href', 'target']
  },

  :transformers => [ initial_linebreak_transformer, empty_paragraph_transformer ]
)