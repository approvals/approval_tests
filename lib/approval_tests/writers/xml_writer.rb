require 'rexml/document'
include REXML

module ApprovalTests
  module Writers
    class XmlWriter
      def initialize(data)
        @data = data
      end
      
      def get_approval_filename(basename)
        basename + ".approved.xml"
      end
      
      def get_received_filename(basename)
        basename + ".received.xml"
      end
      
      def write_received_file(received)
        f = File.new("#{received}", "w+")
        f.write(@data)
        f.close()
        f.path
      end
      class << self
        def pretty_print(parent_node, itab)
          buffer = ''

          parent_node.elements.each do |node|

            buffer += ' ' * itab + "<#{node.name}#{get_att_list(node)}"

            if node.to_a.length > 0
              buffer += ">"
              if node.text.nil?
                buffer += "\n"
                buffer += pretty_print(node,itab+2) 
                buffer += ' ' * itab + "</#{node.name}>\n"
              else
                node_text = node.text.strip
                if node_text != ''
                  buffer += node_text 
                  buffer += "</#{node.name}>\n"        
                else
                  buffer += "\n" + pretty_print(node,itab+2) 
                  buffer += ' ' * itab + "</#{node.name}>\n"        
                end
              end
            else
              buffer += "/>\n"
            end

          end
          buffer
        end

        def get_att_list(node)
          att_list = ''
          node.attributes.each { |attribute, val| att_list += " #{attribute}='#{val}'" }
          att_list
        end

        def pretty_xml(xml_string)
          doc = Document.new(xml_string)

          buffer = ''
          xml_declaration = doc.to_s.match('<\?.*\?>').to_s
          buffer += "#{xml_declaration}\n" if not xml_declaration.nil?
          xml_doctype = doc.to_s.match('<\!.*\">').to_s
          buffer += "#{xml_doctype}\n" if not xml_doctype.nil?
          buffer += "<#{doc.root.name}#{get_att_list(doc.root)}"
          if doc.root.to_a.length > 0
            buffer +=">\n#{pretty_print(doc.root,2)}</#{doc.root.name}>"
          else
            buffer += "/>\n"
          end
        end
      end
    end
  end
end