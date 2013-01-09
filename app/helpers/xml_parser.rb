require 'nokogiri'

module XMLParser
  
  class Reader
  public  
    # initialization
    def initialize(file)
      @mainArr = Array.new
      read(file)
    end
    
    # opens and reads the xml file
      def read(file)          
        @file = Nokogiri::XML(file){ |cfg| cfg.noblanks }          
      end      
      
      # Method to get the xpath
      def getXMLData( xpathObj)        
        @variantArr = Array.new
        @file.xpath(xpathObj).each do |node|   
            recursive_child(node) 
            if !node.next_sibling.nil? && !node.next_sibling.blank?
              recursive_child(node.next_sibling)
            end                                
          return @mainArr          
        end
      end
      
      def printValues(variantArr)        
        @mainArr.push(variantArr)
      end
      
      def recursive_child(node)          
          
          @nodeChildrenCount = node.children.count          
          
          if @nodeChildrenCount > 0
            @nodeChildren = node.children
            (0..@nodeChildrenCount-1).each { |i|
              @nodeChildrenValues = Hash.new
              
              if node.children[i].children.children.empty?
                name = node.children[i].name
                value = node.children[i].text
                if name == "text"
                  name = node.children[i].parent.name
                end
                @nodeChildrenValues[name] = value
                printValues(@nodeChildrenValues)
              end
              
              @nodeSubChildCount = node.children[i].children.count 
              if node.children[i].children != nil && @nodeSubChildCount > 0 && !node.children[i].children.empty?
                recursive_subChild(node.children[i])                
              end  
            }
          else
            @nodeValues = {} 
          end
            
        return @variantTemp
      end
      
      def recursive_subChild(childNode)
           @variantSubArrayTemp = Array.new                                      
              (0..@nodeSubChildCount-1).each { |j|
                @nodeSubChildValues = Hash.new
                  if childNode.children[j].name != "text" && childNode.children[j].name != nil && !childNode.children[j].name.empty? && !childNode.children[j].children.empty? 
                   if childNode.children[j].children.children.empty?
                    name1 = childNode.children[j].name
                    value1 = childNode.children[j].text 
                    if name1 == "text"
                      name1 = childNode.children[j].parent.name
                    end                    
                    if value1!= [] && !value1.empty? && !value1.nil?      
                      @nodeSubChildValues[name1] = value1
                    end 
                    if !@nodeSubChildValues.empty? && !@nodeSubChildValues.blank? && @nodeSubChildValues != []                
                      @variantSubArrayTemp.push(@nodeSubChildValues) 
                      printValues(@nodeSubChildValues)
                    end
                   end
                   if !childNode.children[j].children.nil? && !childNode.children[j].children.empty?
                      recursive_sub_subChild(childNode.children[j])
                   end
                  end 
              }
     end
     
     def recursive_sub_subChild(subChild)
          @subNodeCount = subChild.children.count
          if @subNodeCount > 0
            (0..@subNodeCount-1).each { |k|
                if !subChild.children[k].nil? && !subChild.children[k].blank?
                  recursive_child(subChild.children[k]) 
                end   
             }                               
          end 
           
     end
  end
end
