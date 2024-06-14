<template>
    <div class="profile-back">
        <div class="profile-left">
            <div class="profile-info">
                <ProfileDetails />
            </div>
            <div class="logout-div">
                <logoutComp />
            </div>
        </div>
        <div class="profile-right">
            <div class="hello" style="max-height: calc(100vh - 130px); overflow-y: auto;">
                <UserMotorcycles />
            </div>
        </div>
    </div>
</template>

<script>
import logoutComp from '../auth/LogoutComp.vue';
import ProfileDetails from './ProfileDetails.vue';
import UserMotorcycles from './UserMotorcycles.vue';
import { mapGetters } from 'vuex';

export default {
    computed: {
        ...mapGetters(['isAuthenticated']), 
    },
    components: {
        logoutComp,
        ProfileDetails,
        UserMotorcycles
    },
}
</script>

<style>
.profile-back {
    background-color: #E9EAED;
    min-height: calc(92vh - 110px);
    display: flex;
    padding: 20px;
}
.profile-left, .profile-right {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 0px 3px 3px rgba(0,0,0,0.1);
}
.profile-left {
    width: 450px;
    margin-right: 20px;
}
.profile-right {
    width: 100%;
}
</style>