package com.miu.pasteit.model.entity.activity;

import com.miu.pasteit.model.entity.common.ActivityAction;
import com.miu.pasteit.model.entity.common.ActivityCommon;
import com.miu.pasteit.model.entity.common.Status;
import com.miu.pasteit.model.entity.db.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;


/**
 * @author Rimon Mostafiz
 */
@Data
@NoArgsConstructor
@Document("ACTIVITY_USER")
@EqualsAndHashCode(callSuper = true)
public class ActivityUser extends ActivityCommon {

    @Id
    private String activityId;

    //userId
    private String id;

    private String username;

    private String password;

    private String email;

    private String firstName;

    private String lastName;

    @Enumerated(EnumType.STRING)
    private Status status;

    private static ActivityUser of(User entity) {
        ActivityUser activity = new ActivityUser();

        activity.setId(entity.getId());
        activity.setUsername(entity.getUsername());
        activity.setEmail(entity.getEmail());
        activity.setPassword(entity.getPassword());
        activity.setFirstName(entity.getFirstName());
        activity.setLastName(entity.getLastName());
        activity.setStatus(entity.getStatus());

        ActivityCommon.mapper(activity, entity);
        return activity;
    }

    public static ActivityUser of(User user, String activityUser, ActivityAction activityAction) {
        ActivityUser activity = of(user);
        ActivityCommon.mapper(activity, activityUser, activityAction);
        return activity;
    }

}
