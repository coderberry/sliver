class SliversController < ApplicationController

  def new
    @sliver = Sliver.new
  end





def create

  @sliver = Sliver.new(params[:sliver])
  
  if @sliver.save
  get_code = Iteration.find(:first)

  @a_value = get_code[:a]
  @b_value = get_code[:b]
  @c_value = get_code[:c]
  @d_value = get_code[:d]

#### Set the A Value #####

  if @b_value == 61
    if @a_value < 61
    @a = @a_value +1
    else
      @a = 61
      end
  end

#### Set the B Value #####

  if @c_value == 61
    if @b_value < 61
    @b = @b_value +1
    else
    @b = 61
      end
  end
#### Set the C Value #####


  if @d_value == 61
  if @c_value < 61
    @c = @c_value +1
  else
    @c = 61
  end
  end

#### Set the D Value #####

  if @d_value < 61
    @d = @d_value + 1
  else
    @d = 61
  end




  chars = ["o", "8", "T", "I", "D", "J", "Z", "p", "9", "n", "s", "b", "C", "E", "N", "x", "v", "P", "z", "c", "3", "R", "g", "O", "1", "j", "Y", "W", "K", "w", "A", "M", "t", "i", "B", "S", "U", "Q", "6", "u", "0", "X", "L", "4", "G", "F", "V", "m", "H", "r", "e", "k", "l", "d", "q", "h", "2", "7", "a", "5", "y", "f"]

 @a = @a.to_i
  @b = @b.to_i
  @c = @c.to_i
  @d = @d.to_i



@a.upto(@a) do |c1|
  @b.upto(@b) do |c2|
    @c.upto(@c) do |c3|
      @d.upto(@d) do |c4|
@mcreate = Sliver.update(@sliver.id,{:mini_key => [chars[c1], chars[c2], chars[c3], chars[c4]].join})
@icreate = Iteration.update(1,{:a => @a, :b => @b, :c =>@c, :d => @d})
      end
    end
  end
end

  

        flash[:notice] = 'You Sliver was created successfully!'

        redirect_to :controller => 'slivers' , :action => 'show', :sliver => @mcreate.mini_key

      else

        flash[:warning] = "What the heck! For some reason your sliver didn't create. The url must be valid and contain http://."
         redirect_to :controller => 'slivers' , :action => 'new'
      end
end

def show
  @sliver = Sliver.find_by_mini_key(params[:id])
end

def shadow_display
  @sliver = Sliver.find_by_mini_key(params[:sliver])
end



end

