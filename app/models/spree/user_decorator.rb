Spree::User.class_eval do
  belongs_to :spree_dynamic_bmsm_groups
  attr_accessible :spree_dynamic_bmsm_group_id


  def get_bmsm_group
    if self.spree_dynamic_bmsm_group_id != nil
      self.spree_dynamic_bmsm_group_id
    else
      return 1 #make 1 the default group
    end
  end

  def set_bmsm_group(default=0)
    group_list = Spree::Spree::DynamicBmsmGroup.all.map{|x|x.id}

    ## if a default is given set it as the group
    ## unless it doesnt exist, at which point,
    ## just assign a random 'Existing' group
    if default != 0 && group_list.grep(default).count == 1
      ##assign group ID
      group = default
    else
      ## random assignment
      index_range = group_list.count
      group = group_list[Random.rand(index_range)]   #arrays are 0 indexed as is rand first value
    end

    ##always set the group. Its random unless assigned.    
    self.update_column(:spree_dynamic_bmsm_group_id,group)

    return group #return the group that was set
  end
end
