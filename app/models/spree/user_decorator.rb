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
    ##always set the group. Its random unless assigned.
    #major assumption is that group id 1 exists
    group_list = Spree::DynamicBmsmGroup.all.map{|x|x.id}
    tiers = []

    ## if a default is given set it as the group
    ## unless it doesnt exist, at which point,
    ## just assign a random 'Existing' group
    if default != 0 && group_list.present? && group_list.grep(default).count == 1
      ##assign group ID
      group = default
      tiers =  Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group)
    else
      ## random assignment
      index_range = group_list.count
      group = group_list[Random.rand(index_range)]   #arrays are 0 indexed as is rand first value
      tiers =  Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group)
    end
    if tiers.count == 0
      self.set_bmsm_group #beware recursion, here be dragons!... keep random walking until you hit on a group that has tiers.
    else
      self.update_column(:spree_dynamic_bmsm_group_id,group)

      return group #return the group that was set
    end

  end
end
