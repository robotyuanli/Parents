<?php

namespace App\Observers;

use App\Http\Controllers\UserController;
use App\Models\ParentSlot;

class ParentSlotObserver
{
    /**
     * Handle the parent slot "created" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */
    public function created(ParentSlot $parentSlot)
    {
        //
        $userController = new UserController();
        $userController->StoreLog($parentSlot, "Created: ");
    }

    /**
     * Handle the parent slot "updated" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */
    public function updated(ParentSlot $parentSlot)
    {
        //
        $userController = new UserController();
        $userController->StoreLog($parentSlot, "updated: ");
    }

    /**
     * Handle the parent slot "deleted" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */
    public function deleted(ParentSlot $parentSlot)
    {
        //

        $userController = new UserController();
        $userController->StoreLog($parentSlot, "deleted: ");
    }

    /**
     * Handle the parent slot "restored" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */
    public function restored(ParentSlot $parentSlot)
    {
        //

        $userController = new UserController();
        $userController->StoreLog($parentSlot, "restored: ");
    }

    /**
     * Handle the parent slot "force deleted" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */
    public function forceDeleted(ParentSlot $parentSlot)
    {
        //

        $userController = new UserController();
        $userController->StoreLog($parentSlot, "forceDeleted: ");
    }

    /**
     * Handle the parent slot "retrieved" event.
     *
     * @param  \App\ParentSlot  $parentSlot
     * @return void
     */

    public function retrieved(ParentSlot $parentSlot){
        //
        $userController = new UserController();
        $userController->StoreLog($parentSlot, "retrieved: ");

    }
}
