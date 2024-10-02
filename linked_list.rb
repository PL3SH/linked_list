require './node.rb'
class Linked_list 

    def initialize 
        @head =  nil
    end

    def append(value)
        new_node = Node.new(value)
        # si la cabeza del nodo se encuentra vacia podemos cerear un nuevo nodo el cual sera la cabeza
        if @head.nil?
            @head = new_node
        else
            #en cso que previamente ya hayamos tenido algun nodo creado lo guardaremos en current para asi podernos mover al siguiente espacion
            current = @head
            #con este bucle nos moveremos hasta el ultimo nodo creado ya que en la clase nodo hemos definido por defecto el valor nil en el siguiente nodo
            while current.next_node
                current = current.next_node
            end
            #finalmente en la ultima posicion a la que hemos llegado crearemos el siguiente nodo
            current.next_node = new_node
            # el nodo donde estamos lo guardamos en prev para asi saber el nodo anterior
            new_node.prev_node = current
        end
    end

    def display
        current = @head
        print "Lista enlazada: "
        while current
            print "( #{current.value} ) -> "
            current = current.next_node
        end
        puts "nil"
    end

    def prepend(value)
        display
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            new_node.next_node = @head
            @head.prev_node = new_node
            @head = new_node
        end
    end

    def size
        current = @head
        count = 0
        while current
            count +=1
            current = current.next_node
        end

        puts "Tienes #{count} nodos en la lista"
    end

    def head
        if @head
        puts "La cabeza de la lista es #{@head.value}"
        else
            puts "no hay una cabeza en esta lista"
        end
    end

    def tail 
        current = @head
                while current.next_node != nil
                    current = current.next_node
                end
                tail =  current
                puts "la cola de esta lista es #{tail.value}"
                tail
    end


    def find(value)
        index = 0
        current = @head
        while current
            if current.value == value
                puts "Value: #{current.value}, index: #{index}"
                return
            end
            current = current.next_node
            index += 1
        end
        puts "El valor #{value} no se encuentra en la lista"
    end

    def pop
        puts "lista antes del pop"
        display
        return if @head.nil? # Si la lista está vacía, no hacemos nada

        if @head.next_node.nil?
            @head = nil # Si solo hay un nodo, lo eliminamos
        else
            current = @head
            # me muevo 2 veces para asi saber si el nodo actual es el penultimo ya que el final de una lista siempre es nil
            while current.next_node.next_node != nil
                current = current.next_node
            end
            #a este penultimo elemento lo eliminamos
            current.next_node = nil # Eliminamos el último nodo
        end

        puts "lista después del pop"
        display
    end

    def contains?(value)
        current = @head
        while current
            if current.value == value
                puts "el elemento #{value} ha sido encontrado"
                return true
            end
            current = current.next_node
        end
        puts "El valor #{value} no se encuentra en la lista"
    end

end

list = Linked_list.new
list.append(2)
list.append(123)
list.append(13)
list.append(3)
list.prepend(53)
list.append(83)
list.append(93)
list.append(13)

list.display

list.size

list.head

list.tail

list.find(83)

list.pop

list.contains?(13)