package com.miu.pasteit.model.entity.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Rimon Mostafiz
 */
@Data
@MappedSuperclass
@EqualsAndHashCode(callSuper = true)
@AttributeOverride(name = "version", column = @Column(name = "INTERNAL_VERSION"))
public abstract class ActivityCommon extends EntityCommon implements Serializable {

    protected String activityUser;

    protected int activityAction;

    protected LocalDateTime activityTime;

    protected Long version;

    public static void mapper(ActivityCommon activity, String activityUser, ActivityAction activityAction) {
        activity.setActivityUser(activityUser);
        activity.setActivityAction(activityAction.getAction());
        activity.setActivityTime(LocalDateTime.now());
    }

    public static void mapper(ActivityCommon activity, EntityCommon entity) {
        activity.setCreatedBy(entity.getCreatedBy());
        activity.setCreateTime(entity.getCreateTime());
        activity.setEditedBy(entity.getEditedBy());
        activity.setEditTime(entity.getEditTime());
        activity.setVersion(entity.getVersion());
    }

    public abstract String getId();
}
