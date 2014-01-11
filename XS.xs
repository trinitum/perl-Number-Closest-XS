#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>
#include <math.h>

struct sv_with_distance {
    double distance;
    SV **svp;
};

MODULE = Number::Closest::XS    PACKAGE = Number::Closest::XS    PREFIX = nclosx_
PROTOTYPES: DISABLE

AV*
nclosx__find(center, source, amount)
        double center;
        AV* source;
        int amount;
    PREINIT:
        int length = 0;
        int source_length;
        int i, j;
        SV **item;
        double distance;
        struct sv_with_distance *sorted;
    CODE:
        RETVAL=newAV();
        sv_2mortal((SV*)RETVAL);
        source_length = av_len(source);
        if (source_length >= 0 && amount > 0) {
            /* amount + 1 is to simplify memmove */
            sorted = calloc(amount+1, sizeof(struct sv_with_distance));
            for (i=0; i<= source_length; i++) {
                item = av_fetch(source, i, 0);
                if (item != NULL) {
                    distance = fabs(center - SvNV(*item));
                    if (length == 0 || length < amount && sorted[length - 1].distance <= distance) {
                        /* add this item to the end of the list */
                        sorted[length].distance = distance;
                        sorted[length].svp = item;
                        length++;
                    } else if (sorted[length - 1].distance > distance) {
                        /* insert new element into list */
                        for(j=0; sorted[j].distance <= distance; j++);
                        memmove(sorted+j+1, sorted+j, (length-j) * sizeof(struct sv_with_distance));
                        sorted[j].distance = distance;
                        sorted[j].svp = item;
                        if (length < amount) length++;
                    }
                }
            }
            for (i=0; i<length; i++) {
                av_push(RETVAL, newSVsv(*sorted[i].svp));
            }
            free(sorted);
        }
    OUTPUT:
        RETVAL
